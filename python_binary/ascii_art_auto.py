#!/usr/bin/env python3

import pyfiglet
import random
import requests

def get_random_word():
    """Fetches a random word from an online API."""
    try:
        response = requests.get("https://random-word-api.herokuapp.com/word?number=1")
        response.raise_for_status()
        word = response.json()[0]
        return word
    except requests.RequestException:
        return random.choice(["Python", "DevOps", "SRE", "Terraform", "Cloud", "Automate"])

def generate_ascii_art():
    """Generates ASCII art from a random word."""
    word = get_random_word()
    ascii_art = pyfiglet.figlet_format(word)
    
    print("\n🎨 Generated ASCII Art:\n")
    print(ascii_art)

if __name__ == "__main__":
    generate_ascii_art()
