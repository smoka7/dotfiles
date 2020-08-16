from spotipy.oauth2 import SpotifyClientCredentials
import spotipy
import json

client_credentials_manager = SpotifyClientCredentials(client_id="dba31bdf8d6c4b1294ef2f2450164c04",client_secret="2b4423807f3844289a7377ae2e9c136d")
sp = spotipy.Spotify(client_credentials_manager=client_credentials_manager)
results = sp.search("rock",limit=1,type="playlist")['playlists']
# print(json.dumps(results, indent=4))
# for playlist in enumerate(results['playlists']['items']):
    # print(playlist['id'])
    # print(json.dumps(playlist, indent=2))
for playlist in results['items']:
    print(playlist['name'])
    print(playlist['id'])
    print('  total tracks', playlist['tracks']['total'])

