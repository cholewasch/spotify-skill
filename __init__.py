from mycroft import MycroftSkill, intent_file_handler


class Spotify(MycroftSkill):
    def __init__(self):
        MycroftSkill.__init__(self)

    @intent_file_handler('spotify.intent')
    def handle_spotify(self, message):
        self.speak_dialog('spotify')


def create_skill():
    return Spotify()

