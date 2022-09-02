import random
import requests
import json
import sys
import os


def post_message_to_slack(text, channel, token, blocks=None):
    return requests.post(
        "https://slack.com/api/chat.postMessage",
        {
            "token": token,
            "channel": channel,
            "text": text,
            "blocks": json.dumps(blocks) if blocks else None,
        },
    ).json()


sign_in_phrases = [
    "Aloha kakahiaka",
    "Bon Jour",
    "Buen diya",
    "Buenas dias",
    "Buongiorno",
    "Good morning",
    "Gudmoning",
    "Guten morgen",
    "H4ck1ng t1m3",
    "Howdy",
    "I have arrived",
    "Myttin da",
    "Rahajeng semeng",
    "Reporting for duty",
    "Subha prabhat",
    "Sup",
    "Top O' the morning'",
    "Yo ho",
]

lunch_phrases = [
    "Commencing caloric intake",
    "Getting a bite to eat",
    "Grabbing some grub",
    "Lunch time",
    "Out to lunch",
    "Taking a lunch break",
    "Time for me to eat",
    ":deadpool: Time to make the chimichangas",
    ":avengers-hulk: You wouldn't like me when I'm hangry. Going to eat",
]

sign_off_phrases = [
    "Auf wiedersehen",
    "Adios",
    "Bye",
    "Dolce Far Niente",
    "Good night",
    "Gute nacht",
    "Later",
    "Sayonara",
    "Signing off",
    "Tata for now",
]

group_phrases = [
    "all y'all",
    "comrades",
    "cool cats",
    "cyber warriors",
    "everyone",
    "fam",
    "fellow coworkers",
    "folks",
    "friends",
    "hackers",
    "homies",
    "insider threats",
    "muggles",
    "pals",
    "people",
    "peeps",
    "sportsters",
    "team",
    "Turing testers",
    "whitehats",
    "y'all",
    "youse",
    "yinz",
]

general_emojis = [
    ":1337:",
    ":1up:",
    ":awesome-face:",
    ":aim:",
    ":cat-on-keyboard:",
    ":catjam:",
    ":goomba:",
    ":guyfawkes:",
    ":navi: Hey! Listen! ",
    ":nod-cool:",
    ":popcat:",
    ":robot_face:",
    ":spider-sense:",
    ":trex_qwantz:",
]

sign_in_emojis = [
    ":allthethings:",
    ":blobwave:",
    ":blobwavereverse:",
    ":dancingspider:",
    ":inclusive-wave:",
    ":sonic_dancing:",
    ":wave:",
    ":wookie-dancing:",
]

sign_off_emojis = [
    "ᕕ( ᐛ )ᕗ",
    ":blobwave:",
    ":blobwavereverse:",
    ":inclusive-wave:",
    ":low_battery:",
    ":wave:",
]

lunch_emojis = [
    ":burrito:",
    ":chopsticks:",
    ":dancingpickle:",
    ":knife_fork_plate:",
    ":ramen:",
    ":sandwich:",
    ":taco:",
    ":takeout_box:",
]

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(
            "No argument supplied. Please state the type of message to send: hello, lunch, or bye"
        )
        sys.exit()
    if sys.argv[1] == "hello":
        message = random.choice(sign_in_phrases)
        emojis = general_emojis + sign_in_emojis
    elif sys.argv[1] == "bye":
        message = random.choice(sign_off_phrases)
        emojis = general_emojis + sign_off_emojis
    elif sys.argv[1] == "lunch":
        message = random.choice(lunch_phrases)
        emojis = general_emojis + lunch_emojis
    else:
        print("Supplied argument must be 'hello', 'lunch', or 'bye")
        sys.exit()

    message = message + ", " + random.choice(group_phrases)
    add_emoji = random.randrange(0, 4)
    if add_emoji == 1:
        message = random.choice(emojis) + " " + message

    channel = os.environ.get("SLACK_CHANNEL")
    token = os.environ.get("SLACK_TOKEN")

    if channel and token:
        print(f"Posting this message to Slack channel {channel}:\n {message}")
        post_message_to_slack(message, channel, token)
    else:
        print("Slack token and/or channel missing from environment variables")
