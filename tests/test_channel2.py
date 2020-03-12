import unittest

from rr_graph.channel2 import Channel


class ChannelTests(unittest.TestCase):
    def setUp(self):
        tracks = [(1, 2, 0), (1, 3, 1), (3, 5, 2)]
        self.channel = Channel(tracks)

    def test_init(self):
        self.assertEqual(
            self.channel.tracks, [(1, 2, 0), (1, 3, 1), (3, 5, 2)]
        )

    def test_pack(self):
        self.channel.pack_tracks()
        self.assertEqual(len(self.channel.trees), 2)

        self.assertEqual(
            [xx for xx in self.channel.trees[1]], [(1, 2, 0), (3, 5, 2)]
        )
        self.assertEqual([xx for xx in self.channel.trees[0]], [(1, 3, 1)])
