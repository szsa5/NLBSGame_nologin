# This file contains game actions, their actual definitions start lower in this file.
# The first section contains boilerplate

import datetime
import logging
import re
import string
import time

GameActions = []


def GameAction(location=None, facing=None, cmd=None):
    def decorator(fn):
        global GameActions

        def wrapper(*args, **kwargs):
            result = fn(*args, **kwargs)
            return result

        GameActions += [(location, facing, cmd, wrapper)]
        return wrapper

    return decorator


def checkGameActions(game, line):
    location = game.location
    facing = game.facing

    def __smartMatcher(item, spec):
        # if spec is None, always match
        if spec is None:
            return True

        # if item is identical to spec, match
        if item == spec:
            return True

        # if spec is a list, check if item is listed
        if type(spec) == list:
            return item in spec

        # if spec is a function, call function with item as parameter
        if callable(spec):
            return spec(item)

        # Otherwise, no match
        return False

    for ga in GameActions:
        (loc, fac, cmd, fn) = ga
        locmatch = __smartMatcher(location, loc)
        facmatch = __smartMatcher(facing, fac)
        cmdmatch = __smartMatcher(line, cmd)

        # logging.debug(f"GameAction results for line '{line}': {ga}: {locmatch} {facmatch} {cmdmatch}")

        if locmatch and facmatch and cmdmatch:
            ret = fn(game, line)

            if ret is not None:
                return ret


##############################################################
##############################################################
##
# Game actions start below this line
##
##############################################################
##############################################################

# Getting the visitor badge at the gate

#GATE
@GameAction(location=["gate", "start"],
            facing="guard",
            cmd=lambda l: None is not re.match(
                r'^\s*my\s+name\s+is\s+(.*)\s*$', l, flags=re.IGNORECASE))
def setname(game, line):
    oldname = game.getProperty("name")

    m = re.match(r'^\s*my\s+name\s+is\s+(.*)\s*$', line, flags=re.IGNORECASE)
    name = m.group(1).strip()
    logging.debug(f"Setting name to '{name}'")
    game.setProperty("name", name)
    game.updateInventory("temporary badge", f"A temporary badge with your name: {name}")
    game.setSuccess("enterbank")

    if oldname is None:
        return f"""
The guard prints out a visitor badge with your name and hands it to you.
The guard says: 
    'Be careful and return the badge to me at the end of the day. You can now enter the gate with [use badge]. 
    Have a nice day!'
"""
    return f"""
The guard prints out a new visitor badge with your name and hands it to you.
The guard says: 
'You know the drill, you can enter the gate with [use badge].'
"""

@GameAction(location=["gate", "start"],
            cmd=lambda l: None is not re.match(
                r'^\s*enter\s+bank\s*$', l, flags=re.IGNORECASE))
def enterbank(game, line):
    if None is not game.getInventory("temporary badge"):
        #fail
        game.incrementFail("enterbank")
        return "You are not authorized to enter without an access badge. You have to interact with the guard with [look guard]."
    else:
        return game.teleport("reception",
                             text="""You use your badge and go through the gate.""")

@GameAction(location=["gate", "start"],
            cmd=lambda l: None is not re.match(
                r'^\s*use\s+badge\s*$', l, flags=re.IGNORECASE))
def usebadge(game, line):
    if None is game.getInventory("temporary badge"):
        return "You do not have a visitor badge. Talk to the guard at the gate."

    return game.teleport("reception",
                         text="""You use your badge and go through the gate.""")

#ADMINOFFICE
@GameAction(location="adminoffice",
            facing="program",
            cmd=lambda l: None is not re.match(
                r'^\s*test\s+(.*)\s*$', l, flags=re.IGNORECASE))

def testpassword(game,line):
    m = re.match( r'^\s*test\s+(.*)\s*$', line, flags=re.IGNORECASE)
    password = m.group(1).strip()
    officePassword = game.getProperty("adminoffice_password")
    if password == officePassword:
        game.setProperty("adminoffice_loggedin","true")

        if officePassword == "admin":
            return "You have figured out the password and logged into the program now rather easily.\n" \
                   "The Grinch could also access the program easily. There are two options showing now [log out] \n" \
                   "or [change password]. Which one will you choose?"
        else:
            return "There are two options showing now [log out] or [change password] to start the process. " \
                   "Which one will you choose?"


    return "The program shows an alert: 'Wrong password.'"

@GameAction(location="adminoffice",
            facing="program",
            cmd=lambda l: None is not re.match(
                r'^\s*change\s+password\s*$', l, flags=re.IGNORECASE))
def changepassword(game,line):
    if game.getProperty("adminoffice_loggedin") == "false":
        return "You need to log in to do that."
    return "Enter a new password using [enter password] according to the bank’s password policy."

@GameAction(location="adminoffice",
            facing="program",
            cmd=lambda l: None is not re.match(
                r'^\s*enter\s+(.*)\s*$', l, flags=re.IGNORECASE))
def enterpassword(game,line):
    if game.getProperty("adminoffice_loggedin") == "false":
        return "You need to log in to do that."
    m = re.match( r'^\s*enter\s+(.*)\s*$', line, flags=re.IGNORECASE)
    password = m.group(1).strip()
    #if re.fullmatch('(?=.*\d)(?=.*[a-z])(?=.*[A-Z])((?=.*\W)|(?=.*_))^[^ ]+$', password):
    if re.fullmatch('((?=.*\d)(?=.*[a-z])(?=.*[A-Z])|(?=.*\d)(?=.*[a-zA-Z])(?=.*[\W_])|(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_])).*', password):
        password = m.group(1).strip()
        game.setProperty("adminoffice_password", password)
        #success
        game.setSuccess("changepassword")
        game.setFacing(None)
        return "You've successfuly changed the password - hopefully the Grinch won't be able to log in now.\n" \
               "Suddenly the lights start flickering. It seems there is a fault in the electrical system.\n" \
               "It could be the Grinch trying to tamper with the power supply. You can head to the Newsroom to \n" \
               "check the news. Use [tp newsroom]."
    return "You need to comply with the password policy. You can find the policies in the" \
           " Sec. office (SKR) [tp skr] and teleport back using [tp adminoffice]."


@GameAction(location="adminoffice",
            facing="program",
            cmd=lambda l: None is not re.match(
                r'^\s*log\s+out\s*$', l, flags=re.IGNORECASE))
def logout(game,line):
    if game.getProperty("adminoffice_loggedin") == "false":
        return "You need to log in to log out."
    game.setFacing(None)
    game.setProperty("adminoffice_loggedin", "false")
    officePassword = game.getProperty("adminoffice_password")
    if officePassword == "admin":
        game.incrementFail("changepassword")
        #fail

    return "The program shows: 'Logging out...'. After a while, a pop-up shows: 'You've logged out successfully.'\n"
    f"From here you can go: {game.currentRoom().directionsText()}\n"\
                "You can use [map] to check the map"

#SKR
#NEWSROOM

#OPENOFFICE
@GameAction(location="openoffice",
            facing="pile",
            cmd=lambda l: None is not re.match(
                r'^\s*leave\s+paper\s*$', l, flags=re.IGNORECASE))
def leavepaper(game, line):
    if game.getProperty("pile_on_desk") == "true":
        #fail
        game.incrementFail("pile")
        return "You leave the desk as it is. You're keen on checking the admin office now, \n" \
               "use [tp adminoffice]."
    return "You can't do that."

@GameAction(location="openoffice",
            facing="pile",
            cmd=lambda l: None is not re.match(
                r'^\s*delete\s+pile\s*$', l, flags=re.IGNORECASE))
def deletepile(game, line):
    if game.getProperty("pile_on_desk") == "true":
        #success
        game.setSuccess("pile")
        game.setProperty("pile_on_desk", "false")
        return "You place the pile in the bottom drawer of the desk. You're keen on checking the admin office now, \n" \
               "use [tp adminoffice]."
    return "You can't do that."

#if the pile is gone
@GameAction(location="openoffice",
            cmd=lambda l: None is not re.match(
                r'^\s*(l|look)\s*$', l, flags=re.IGNORECASE))
def look(game, line):
    if game.getProperty("pile_on_desk") == "false":
        return "Several desks are arranged around a series of whiteboards. All desks have " \
               "fancy-looking computers on them. One of the computers seems to be running a " \
               "*simulation* of some kind. There are some colorful motivational posters hanging on the walls."

@GameAction(location="openoffice",
            cmd=lambda l: None is not re.match(
                r'^\s*(l|look)\s+pile\s*$', l, flags=re.IGNORECASE))
def lookpile(game, line):
    if game.getProperty("pile_on_desk") == "false":
        return "You open the bottom drawer of the desk. Yep. The pile of papers is still " \
               "in the drawer."

#TRAINSTATION
@GameAction(location="trainstation",
            cmd=lambda l: None is not re.match(
                r'^\s*1\s*$', l, flags=re.IGNORECASE))
def firstoption(game, line):
    game.incrementFail("checkreport")
    return "Security awareness could be better…\n\n"+game.teleport("home",True)

@GameAction(location="trainstation",
            cmd=lambda l: None is not re.match(
                r'^\s*2\s*$', l, flags=re.IGNORECASE))
def secondoption(game, line):
    game.setSuccess("checkreport")
    return "Good security awareness!\n\n"+game.teleport("home",True)

@GameAction(location="trainstation",
            cmd=lambda l: None is not re.match(
                r'^\s*3\s*$', l, flags=re.IGNORECASE))
def thirdoption(game, line):
    game.incrementFail("checkreport")
    return "Security awareness could be better …\n\n"+game.teleport("home",True)

#NEWSROOM
@GameAction(location="newsroom",
            cmd=lambda l: None is not re.match(
                r'^\s*leave\s+office\s*$', l, flags=re.IGNORECASE))
def leaveoffice(game, line):
        return "You leave the office through the back entrance. You head towards the train station." + "\n\n" +game.teleport("trainstation")

#RECEPTION

#TRADINGENTRANCE
@GameAction(location="tradingentrance",
            cmd=lambda l: None is not re.match(
                r'^\s*use\s+badge\s*$', l, flags=re.IGNORECASE))
def usebadge_trading(game, line):
    if None is game.getInventory("badge"):
        return "You are not authorized to enter the trading room using a temporary badge. \n" \
               "You should collect your new badge at IT Ops. You can get to IT Ops using [tp IT]."
    return game.teleport("trading")

#TRADING
@GameAction(location="trading",
            cmd=lambda l: None is not re.match(
                r'^\s*print\s+report\s*$', l, flags=re.IGNORECASE))
def printreport(game, line):

    if None is game.getInventory("report"):
        return "You print the report. A “Confidential” label is printed on top of the document indicating \n" \
               "its classification. You collect the report and head to your office\n" \
               "to scan and send the report.\n" \
               f"From here you can go: {game.currentRoom().directionsText()}"

    return "You already have the report."

#YOUROFFICE
@GameAction(location="youroffice",
            facing="email",
            cmd=lambda l: None is not re.match(
                r'^\s*read\s+latest\s*$', l, flags=re.IGNORECASE))
def reademails(game, line):
    game.setFacing("latestemail")
    return "From: NYDFS.auth0rity.g0v\n" \
           "Title: Urgent – Action Needed \n\n" \
           "Dear Employee,\n\n" \
           "The NY DFS authority has detected an attempted cyber attack, launched by the Grinch. \n" \
           "This requires the providing of critical data from your bank, allowing the DFS to detect any\n" \
           "successful attack. Please click on this link to upload your daily financial report.\n\n" \
           "Best Regards,\n" \
           "NY DFS\n\n" \
           "Do you want to send the report? Yes [yes] or no [no]?\n" \
           "Provide a reason for your decision using [feedback text]."

@GameAction(location="youroffice",
            facing="latestemail",
            cmd=lambda l: None is not re.match(
                r'^\s*yes\s*$', l, flags=re.IGNORECASE))
def yes(game, line):
    if game.getProperty("email_decided") == "false":
        game.incrementFail("email")
        game.setProperty("email_decided", "true")
        return "Do you think that NY DFS would request the disclosure of confidential data over email?\n" \
               "Looking carefully, one could see that the email address appears to be but \n" \
               "is not for the NY DFS official authority. "\
               "Please provide a reason for your choice using [feedback reason].\n\n" \
               "After providing feedback, your next objective is to check whether\n" \
               "there are any security issues that you can spot.\n" \
               f"From here you can go: {game.currentRoom().directionsText()}\n"\
                "You can use [map] to check the map"
    return "You've already done that."

@GameAction(location="youroffice",
            facing="latestemail",
            cmd=lambda l: None is not re.match(
                r'^\s*no\s*$', l, flags=re.IGNORECASE))
def no(game, line):
    if game.getProperty("email_decided") == "false":
        game.setSuccess("email")
        game.setProperty("email_decided","true")
        return "Correct. The email is a phishing attack that could be launched by the Grinch. \n" \
               "The email of the sender has numbers instead of letters. NY DFS will never request\n" \
               "sending confidential information via email. You cannot be fooled by such an attempt.\n" \
               "Please provide a reason for your choice using [feedback reason].\n\n" \
               "After providing a feedback, your next objective is to check whether\n" \
               "there are any security issues that you can spot.\n"\
                f"From here you can go: {game.currentRoom().directionsText()}\n"\
                "You can use [map] to check the map"
    return "You've already done that."

#IT
@GameAction(location="it",
            cmd=lambda l: None is not re.match(
                r'^\s*collect\s+badge\s*$', l, flags=re.IGNORECASE))
def collectbadge(game, line):
    if None is game.getInventory("badge"):
        if None is not game.getInventory("temporary badge"):
            game.removeInventory("temporary badge")
        game.updateInventory("badge", f"Your badge.")
        return "You got a new badge with an access permission to the trading room.\n" \
               " You know that it has been approved by head of Treasury. You are impressed \n" \
               "by how quick things work. The picture on the badge is the same picture \n" \
               "on the previous badge, which you did not like this much. Nevertheless, \n" \
               "now you can go to the trading room to continue your work.\n" \
               "Use [tp trading] to return to the Trading Room.\n"
    return "You've already done that."

#HOME - end of game
@GameAction(location="home",
            cmd=lambda l: None is not re.match(
                r'^\s*look\s+computer\s*$', l, flags=re.IGNORECASE))
def lookcomputer(game, line):
    game.setName = True
    return game.currentRoom().itemDescription("computer^success^printornot") +"\n\n" \
           "Thanks for playing the NLBS Game! You can exit the game by pressing enter..."
