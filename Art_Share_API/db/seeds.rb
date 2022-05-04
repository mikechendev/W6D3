# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
    { username: 'Tom'}, 
    { username: 'Duncan'}, 
    { username: 'Leo'}, 
    { username: 'Nikhil'}, 
    { username: 'Kevin'}, 
    { username: 'Vivian'}
])

artworks = Artwork.create([
    {artist_id: 1, title: 'Mona Lisa', image_url: 'monalisa.url'},
    {artist_id: 2, title: 'The Raft of the Medusa', image_url: 'theraftofthemedusa.url'},
    {artist_id: 2, title: 'Studio of a Painter', image_url: 'studioofapainter.url'},
    {artist_id: 3, title: 'Are you jealous?', image_url: 'areyoujealous?.url'},
    {artist_id: 4, title: 'American Gothic', image_url: 'americangothic.url'},
    {artist_id: 5, title: 'The Starry Night', image_url: 'thestarrynight.url'},
    {artist_id: 6, title: 'The Night Cafe', image_url: 'thenightcafe.url'},
    {artist_id: 6, title: 'Girl with a Pearl Earring', image_url: 'girlwithapearlearring.url'}
])

artwork_share = ArtworkShare.create([
    {artwork_id: 1, viewer_id: 2},
    {artwork_id: 2, viewer_id: 1},
    {artwork_id: 3, viewer_id: 4},
    {artwork_id: 4, viewer_id: 3},
    {artwork_id: 5, viewer_id: 7},
    {artwork_id: 6, viewer_id: 5},
    {artwork_id: 7, viewer_id: 6},
    {artwork_id: 8, viewer_id: 8}
])