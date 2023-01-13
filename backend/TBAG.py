#!/usr/bin/env python3

import json
import logging
import os
import random
import string
import yaml
import math

from GameActions import *
from datetime import datetime

# TBAG stands for Text Based Adventure Game
# This is not intended to be reusable for now

CHEATS = not True
ROOMSDIR = "rooms"


def makeRandomPassword():
    pwconf = {
        string.ascii_uppercase: 2,
        string.ascii_lowercase: 3,
        string.digits: 2,
        "!@#$%": 1,
    }

    pwchars = []

    for k, v in pwconf.items():
        pwchars += [random.choice(k) for _ in range(v)]

    random.shuffle(pwchars)
    pw = "".join([c for c in pwchars])
    return pw


def getLongestString(list):
    max = list[0][0]
    for a in list:
        for b in a:
            if len(b) > len(max):
                max = b

    return max


class Room():
    def __init__(self, roomid):
        self._logger = logging.getLogger("Room")
        self._fn = os.path.join(ROOMSDIR, f"{roomid}.yaml")
        self._roomid = roomid
        self._data = yaml.full_load(open(self._fn).read())

    @staticmethod
    def exists(room):
        try:
            r = Room(room)
            return True
        except:
            pass
        return False

    @property
    def roomid(self):
        return self._roomid

    @property
    def name(self):
        return self._data["name"]

    def directionsText(self):
        upperdirections = ["n", "s", "e", "w", "ne", "se", "nw", "sw"]
        directions = [(x.upper() if x in upperdirections else x)
                      for x in self.directions]
        directions = sorted(directions)
        directions = ", ".join(directions)
        return directions

    def description(self, show_name=True, show_directions=True, append=None):
        name = self.name
        directions = self.directionsText()

        description = self._data["description"]
        out = []

        if show_name:
            out += [f">>> Your location: {name}"]

        out += [description]

        if append is not None:
            out += [append]

        if show_directions and directions != "":
            out += [f"From here you can go: {directions}"]

        return "\n\n".join([x.strip("\n") for x in out])

    @property
    def directions(self):
        if "directions" not in self._data:
            return []
        return [x.lower() for x in self._data["directions"].keys()]

    @property
    def items(self):
        if "items" not in self._data:
            return []

        return [x.lower() for x in self._data["items"].keys()]

    def itemDescription(self, item, append=None):
        out = [self._data["items"][item]]
        if append is not None:
            out += [append]

        return "\n\n".join([x.strip("\n") for x in out])

    def nextRoom(self, direction):
        return self._data["directions"][direction]


class TBAG():
    ROOMS_VISITED = {
        "gate": False,
        "skr": False,
        "adminoffice": False,
        "newsroom": False,
        "openoffice": False,
        "trainstation": False,
        "home": False,
        "reception": False,
        "trading": False,
        "youroffice": False,
        "it": False
    }
    VISIT_COUNT = {
        "gate": 1,
        "skr": 0,
        "adminoffice": 0,
        "newsroom": 0,
        "openoffice": 0,
        "trainstation": 0,
        "home": 0,
        "reception": 0,
        "trading": 0,
        "youroffice": 0,
        "it": 0
    }

    def __init__(self, statefn, userid):
        self._statefn = statefn
        self._userid = userid
        self._logger = logging.getLogger("TBAG")
        self.loadState()
        self._youreheretext = "<you're here>"
        self.setName = False

    # State management
    def loadState(self):
        try:
            self._state = json.load(open(self._statefn))

            # self._logger.info(f"Loading state from {self._statefn}")
        except Exception as e:
            self._logger.warning(
                f"Loading state failed because: {e}, reverting to default state"
            )
            self._state = {}

            # Set rooms visited
            roomsvisited = list(self.ROOMS_VISITED.keys())
            self._state["visited"] = [(k, self.ROOMS_VISITED[k])
                                      for k in roomsvisited]

            # Set visit counter
            visitcount = list(self.VISIT_COUNT.keys())
            self._state["visitcount"] = [(k, self.VISIT_COUNT[k])
                                         for k in visitcount]

            initialTracking = {
                "gate": {
                    "enterbank": {
                        "name": "Use access badge for entry",
                        "fail": 0,
                        "success": False
                    }
                },
                "adminoffice": {
                    "changepassword": {
                        "name": "Replace simple passwords",
                        "fail": 0,
                        "success": False
                    },
                    "regex": {
                        "name": "Comply with password complexity",
                        "fail": 0,
                        "success": False
                    }
                },
                "newsroom": {
                    "internet": {
                        "name": "Connect to the disaster communication system",
                        "fail": 0,
                        "success": False
                    }
                },
                "openoffice": {
                    "pile": {
                        "name": "Remove confidential data",
                        "fail": 0,
                        "success": False
                    }
                },
                "trainstation": {
                    "checkreport": {
                        "name": "Access confidential data in public",
                        "fail": 0,
                        "success": False
                    }
                },
                "home": {
                    "printornot": {
                        "name": "Appropriate devices for remote access",
                        "fail": 0,
                        "success": False
                    }
                },
                "youroffice": {
                    "email": {
                        "name": "Respond to phishing email",
                        "fail": 0,
                        "success": False
                    }
                }
            }

            self._state["tracking"] = initialTracking
            self.setProperty("email_decided", "false")
            self.setProperty("adminoffice_loggedin", "false")
            self.setProperty("adminoffice_password", "admin")
            self.setProperty("pile_on_desk", "true")
            self.setProperty("password", makeRandomPassword())
            self.setProperty("username", "greenmeanmachine")  # FIXME

    def saveState(self):
        try:
            # create directories
            dn = os.path.dirname(self._statefn)
            if dn != "":
                os.makedirs(dn, exist_ok=True)
            json.dump(self._state,
                      open(self._statefn, "w"),
                      sort_keys=True,
                      indent=4)
            # self._logger.info(f"Saved state to {self._statefn}")
        except Exception as e:
            self._logger.error(f"Saving state failed because: {e}")

    def getProperty(self, name, default=None):
        if name in self._state:
            return self._state[name]
        return default

    def setProperty(self, name, value):
        self._state[name] = value
        self.saveState()

    # Location & map
    @property
    def location(self):
        return self.getProperty("location", default="gate")

    def setLocation(self, loc):
        self.setProperty("location", loc)
        self.roomSetVisited(loc)
        self.incrementVisitCount(loc)

        return Room(loc).description()

    def teleport(self, loc, admin=False, text=None):
        if admin == False:
            if self.location == "trainstation" or self.location == "home":
                return "You can't do that here."

        # reroute trading tp to entrance
        if loc == "trading":
            self.setLocation("tradingentrance")
        else:
            self.setLocation(loc)

        newdesc = self.currentRoom().description()
        desc = ""
        if text is not None:
            desc += text
            desc += "\n\n"
        desc += newdesc
        return desc

    def loadMap(self):
        gate = Room("gate")
        skr = Room("skr")
        adminoffice = Room("adminoffice")
        newsroom = Room("newsroom")
        openoffice = Room("openoffice")
        it = Room("it")
        reception = Room("reception")
        trading = Room("trading")
        youroffice = Room("youroffice")

        trainstation = Room("trainstation")
        home = Room("home")
        map = [
            ['', skr.name, adminoffice.name, newsroom.name, '', trainstation.name, home.name, ''],
            ['', self.roomGetVisited(skr.roomid), self.roomGetVisited(adminoffice.roomid),
             self.roomGetVisited(newsroom.roomid), '---------->', self.roomGetVisited(trainstation.roomid),
             self.roomGetVisited(home.roomid), ''],
            #
            ['', openoffice.name, youroffice.name, '', '', '', '', ''],
            ['', self.roomGetVisited(openoffice.roomid), self.roomGetVisited(youroffice.roomid), '', '', '', '', ''],
            #
            [gate.name, reception.name, trading.name, '', it.name, '', '', ''],
            [self.roomGetVisited(gate.roomid), self.roomGetVisited(reception.roomid),
             self.roomGetVisited(trading.roomid), '', self.roomGetVisited(it.roomid), '', '', '']
        ]
        return map

    # Tracking
    def currentRoom(self):
        return Room(self.location)

    def incrementVisitCount(self, roomid=None):
        if roomid is None:
            roomid = self.currentRoom().roomid

        visitcount = self.getProperty("visitcount")
        newvisitcount = []
        for k, v in visitcount:
            # set previous current to visited
            if k == roomid:
                val = v + 1
            else:
                val = v

            newvisitcount += [(k, val)]

        self.setProperty("visitcount", newvisitcount)

    def roomGetVisited(self, roomid=None):
        if roomid is None:
            roomid = self.currentRoom().roomid

        visited = dict(self.getProperty("visited"))

        if visited[roomid] == True:
            return "x"
        elif visited[roomid] == "current":
            return self._youreheretext
        else:
            return ""

    def roomSetVisited(self, roomid=None):
        if roomid is None:
            roomid = self.currentRoom().roomid

        # convert tradingentrance to trading
        if roomid == "tradingentrance":
            roomid = "trading"

        self._logger.info("setting visisted: " + roomid)

        # if not self.roomAlreadyVisited(roomid):
        visitedrooms = self.getProperty("visited")
        newvisitedrooms = []
        for k, v in visitedrooms:
            # set previous current to visited
            if k == roomid:
                val = 'current'
            else:
                if v == 'current':
                    val = True
                else:
                    val = v

            newvisitedrooms += [(k, val)]

        self.setProperty("visited", newvisitedrooms)

    def incrementFail(self, event, roomid=None):
        if roomid is None:
            roomid = self.currentRoom().roomid

        trackingdata = self.getProperty("tracking")
        trackingdata[roomid][event]["fail"] += 1
        self.setProperty("tracking", trackingdata)

    def setSuccess(self, event, roomid=None):
        if roomid is None:
            roomid = self.currentRoom().roomid

        trackingdata = self.getProperty("tracking")
        trackingdata[roomid][event]["success"] = True
        self.setProperty("tracking", trackingdata)

    # Facing
    def setFacing(self, target):
        self.setProperty("facing", target)

    @property
    def facing(self):
        return self.getProperty("facing", default=None)

    # Inventory
    def getInventory(self, item):
        iv = self.inventory
        if item in iv:
            return iv[item]
        else:
            return None

    def updateInventory(self, item, name):
        iv = self.inventory
        iv[item] = name
        self.setProperty("inventory", iv)

    def removeInventory(self, item):
        iv = self.inventory
        if item in iv:
            del iv[item]
        self.setProperty("inventory", iv)

    @property
    def inventory(self):
        return self.getProperty("inventory", default={})

    # Radio frequency
    def getRadioFrequency(self):
        return self.getProperty("currentfrequency", "100.0")

    def setRadioFrequency(self, freq=None):
        # if None, set a random frequency that is not the ninjas radio
        if freq is None:
            v = self.getProperty("frequency")
            while v == self.getProperty("frequency"):
                v = random.randrange(880, 1080) / 10.0
            freq = f"{v:.1f}"

        self.setProperty("currentfrequency", freq)
        return self.getRadioFrequency()

    # Indent output
    def indent(self, txt):
        """
        Indent lines of text to output.
        """

        indent = " " * 2
        lines = txt.strip("\n").split("\n")

        out = [f"{indent}{x}" for x in lines]
        out = [""] + out + [""]

        return "\n".join(out)

    # Command handling
    def handle(self, line):
        """
        Handle a command sent by the player. We are case sensitive, but not space sensitive
        Default commands we want to handle:
            help
            g <direction>, go <direction>
                n e s w ne se nw sw up down are shortcuts for "go"
            l <direction>, look <target>

        """
        self._logger.debug(f"Handling line: {line}")

        ret = checkGameActions(self, line)

        if ret is not None:
            return self.indent(ret)

        parts = line.split()

        # if just pressing enter, they want to clear the screen, allow that
        if len(parts) == 0:
            return ""

        # Handle help
        if parts[0].lower() == "help":
            return self.indent(self.handleHelp())

        # Handle map
        if parts[0].lower() == "map":
            return self.indent(self.handleMap())

        # Handle feedback
        if parts[0].lower() == "feedback" and len(parts) >= 2:
            message = line.split(" ", 1)[1]
            return self.indent(self.handleFeedback(message))

        # Handle move
        if parts[0].lower() in ["g", "go"] and len(parts) == 2:
            return self.indent(self.handleMove(parts[1]))

        if parts[0].lower() in [
            "n", "e", "s", "w", "ne", "se", "nw", "sw", "up", "down"
        ] and len(parts) == 1:
            return self.indent(self.handleMove(parts[0]))

        # Handle look
        if parts[0].lower() in ["l", "look"]:
            if len(parts) == 1:
                return self.indent(self.handleLook())

            if len(parts) == 2:
                return self.indent(self.handleLook(parts[1]))

        if parts[0].lower() in ["i", "inventory"] and len(parts) == 1:
            return self.indent(self.handleInventory())

        if parts[0].lower() in ["tp", "teleport"] and len(parts) == 2:
            roomname = parts[1]
            if Room.exists(roomname):
                return self.indent(self.teleport(parts[1]))
            else:
                return self.indent(f"*** Failed to teleport: {roomname} is not an existing room ***")

        return self.indent(
            "I did not understand that. Type 'help' if you don't know what to do here."
        )

    def handleHelp(self):
        return """You are playing the NLBS Game
To interact with the virtual world, you can use these commands:

    [look target]
        Look at a certain target. Targets are identified in texts by enclosing asterisks.
        Omit the asterisks for this command.
        If target is omitted, you are shown a description of your location.
        You can abbreviate "look" with "l".

    [go direction]
        Move in a certain direction. Typical directions are N, S, E, W.
        You can use these directions without the "go" command.
        You can also abbreviate "go" with "g".

    [inventory]
        Show items in your inventory. You can abbreviate "inventory" with "i".

    [map]
        Print out the map, where you've been to, and your current location.

    [feedback message]
        You can contribute to enhancing the security in the current room.
        Use: feedback your_feedback

    <other commands>
        Other commands will be revealed to you while interacting with the world.
        They are enclosed in square brackets '[' and ']'.
        Pay close attention so you do not miss them.
"""

    def handleInventory(self):
        iv = self.inventory
        if iv == {}:
            return "Your inventory is empty."

        items = list(sorted(iv.keys()))
        maxlen = max([len(x) for x in items])

        if len(items) == 1:
            out = [f"You have 1 item in your inventory:"]
        else:
            out = [f"You have {len(items)} items in your inventory:"]

        for item in sorted(iv.keys()):
            spaces = " " * (maxlen - len(item))
            out += [f"    {item}{spaces} -- {iv[item]}"]

        return "\n".join(out)

    def handleMove(self, direction):
        self.setFacing(None)

        exits = self.currentRoom().directions
        if direction.lower() not in exits:
            return "You cannot go there."
        nextlocation = self.currentRoom().nextRoom(direction.lower())
        self.setLocation(nextlocation)
        return self.handleLook()

    def handleLook(self, target=None):

        if target is None:
            self.setFacing(None)
            ret = checkGameActions(self, "look")
            if ret is not None:
                return ret
            return self.currentRoom().description()

        items = self.currentRoom().items

        # handle look fail items
        for item in items:
            if target.lower() == item.split('^')[0].lower():
                # if item has event values
                if len((item.split('^'))) == 3:
                    success_or_fail = item.split('^')[1]
                    eventname = item.split('^')[2]

                    if success_or_fail == "fail":
                        self.incrementFail(eventname)
                    elif success_or_fail == "success":
                        self.setSuccess(eventname)

                    self._logger.info("set")

                self.setFacing(target.lower())
                self._logger.info("setfacing")
                return self.currentRoom().itemDescription(item)

        return "You cannot look there."

    def handleMap(self):
        self._logger.info("location" + self.location)
        # ensure gate is visited
        if self.location == "gate":
            self.roomSetVisited("gate")

        map = self.loadMap()
        output = ''
        longeststring = getLongestString(map)
        line = '+---'
        linelength = len(line)
        numofcols = len(map[0])

        if len(self._youreheretext) > len(longeststring):
            FIELDSIZE = len(self._youreheretext)
        else:
            FIELDSIZE = len(longeststring)

        rowsize = (FIELDSIZE + 1) * numofcols
        numoflines = math.floor(rowsize / linelength)
        left = rowsize % linelength

        spaces = [None] * numofcols

        for i, a in enumerate(map):
            if i % 2 == 0:
                output += '\n' + line * numoflines + '-' * left + '+'
            for j, b in enumerate(a):
                if i % 2 == 0:
                    # getting + spacing - get length of roomname
                    spaces[j] = len(b)

                    # printing
                    if j == 0:
                        output += '\n|{:^{x}}'.format(b, x=FIELDSIZE)
                    else:
                        output += '|{:^{x}}'.format(b, x=FIELDSIZE)
                else:
                    if j == 0:
                        output += '\n|{:^{x}}'.format(b, x=FIELDSIZE)
                    else:
                        output += '|{:^{x}}'.format(b, x=FIELDSIZE)
            output += '|'
        output += '\n' + line * numoflines + '-' * left + '+\n\n'

        compass = [
            [' ', ' ', ' ', ' ', ' ', 'E', ' ', ' ', ' ', ' ', ' '],
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
            [' ', ' ', ' ', ' ', ' ', '∧', ' ', ' ', ' ', ' ', ' '],
            [' ', ' ', ' ', ' ', ' ', '|', ' ', ' ', ' ', ' ', ' '],
            [' ', ' ', ' ', ' ', ' ', '|', ' ', ' ', ' ', ' ', ' '],
            ['N', ' ', '<', '-', '-', '.', '-', '-', '>', ' ', 'S'],
            [' ', ' ', ' ', ' ', ' ', '|', ' ', ' ', ' ', ' ', ' '],
            [' ', ' ', ' ', ' ', ' ', '|', ' ', ' ', ' ', ' ', ' '],
            [' ', ' ', ' ', ' ', ' ', '∨', ' ', ' ', ' ', ' ', ' '],
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
            [' ', ' ', ' ', ' ', ' ', 'W', ' ', ' ', ' ', ' ', ' ']
        ]

        for a in compass:
            output += " ".join(a) + '\n'
        output += '\n'

        output += f"From here you can go: {self.currentRoom().directionsText()}\n"
        return output

    def handleFeedback(self, message):
        feedbackfile = os.path.join("data", "feedback.json")
        now = datetime.now()
        if self.getProperty("name") != None:
            name = self.getProperty("name")
        else:
            name = "no name"
        feedback = {
            "feedbackId": 1,
            "room": self.currentRoom().roomid,
            "user": self.getProperty("name"),
            "datetime": now.strftime("%d/%m/%Y %H:%M:%S"),
            "message": message
        }

        a = []
        # if feedbackfile doesnt exist
        if not os.path.isfile(feedbackfile):
            a.append(feedback)
            with open(feedbackfile, mode='w') as f:
                f.write(json.dumps(a, indent=2))

        # if feedbackfile exists
        else:
            with open(feedbackfile) as content:
                jsoncontent = json.load(content)

            for jsonfeedback in jsoncontent:
                a.append(jsonfeedback)
                lastid = jsonfeedback["feedbackId"]

            feedback["feedbackId"] = lastid + 1
            a.append(feedback)
            with open(feedbackfile, mode='w') as f:
                f.write(json.dumps(a, indent=2))

        return "Thank you for your feedback!"


if __name__ == "__main__":
    import sys

    logging.basicConfig(level="DEBUG")
    fn = "persistent/mygame.json"
    if len(sys.argv) > 1:
        fn = sys.argv[1]

    game = TBAG(fn)

    print()
    print("Welcome to the game.".center(80))
    print("-- Type 'help' to start --".center(80))
    print()

    game.Login()

    while text != "quit":
        print(game.handle(text))
        game = TBAG(fn)
        text = input("$ / > ")
