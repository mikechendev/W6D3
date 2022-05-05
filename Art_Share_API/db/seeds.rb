# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all
Comment.destroy_all

ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('artworks')
ApplicationRecord.connection.reset_pk_sequence!('artwork_shares')
ApplicationRecord.connection.reset_pk_sequence!('comments')

u1 = User.create(username: 'Tom')
u2 = User.create(username: 'Duncan')
u3 = User.create(username: 'Leo')
u4 = User.create(username: 'Nikhil')
u5 = User.create(username: 'Kevin')
u6 = User.create(username: 'Vivian')

artwork1 = Artwork.create(artist_id: u1.id, title: 'Mona Lisa', image_url: 'monalisa.url')
artwork2 = Artwork.create(artist_id: u2.id, title: 'The Raft of the Medusa', image_url: 'theraftofthemedusa.url')
artwork3 = Artwork.create(artist_id: u2.id, title: 'Studio of a Painter', image_url: 'studioofapainter.url')
artwork4 = Artwork.create(artist_id: u3.id, title: 'Are you jealous?', image_url: 'areyoujealous?.url')
artwork5 = Artwork.create(artist_id: u4.id, title: 'American Gothic', image_url: 'americangothic.url')
artwork6 = Artwork.create(artist_id: u5.id, title: 'The Starry Night', image_url: 'thestarrynight.url')
artwork7 = Artwork.create(artist_id: u6.id, title: 'The Night Cafe', image_url: 'thenightcafe.url')
artwork8 = Artwork.create(artist_id: u6.id, title: 'Girl with a Pearl Earring', image_url: 'girlwithapearlearring.url')


artworkshare1 = ArtworkShare.create(artwork_id: artwork1.id, viewer_id: u2.id)
artworkshare2 = ArtworkShare.create(artwork_id: artwork2.id, viewer_id: u1.id)
artworkshare3 = ArtworkShare.create(artwork_id: artwork3.id, viewer_id: u4.id)
artworkshare4 = ArtworkShare.create(artwork_id: artwork4.id, viewer_id: u3.id)
artworkshare5 = ArtworkShare.create(artwork_id: artwork5.id, viewer_id: u5.id)
artworkshare6 = ArtworkShare.create(artwork_id: artwork6.id, viewer_id: u6.id)
artworkshare7 = ArtworkShare.create(artwork_id: artwork7.id, viewer_id: u5.id)
artworkshare8 = ArtworkShare.create(artwork_id: artwork6.id, viewer_id: u6.id)

comment1 = Comment.create(body: 'does this work??', artwork_id: artwork1.id, user_id: u1.id)
comment2 = Comment.create(body: 'this sucks', artwork_id: artwork2.id, user_id: u2.id)
comment3 = Comment.create(body: 'hello?', artwork_id: artwork3.id, user_id: u3.id)
comment4 = Comment.create(body: 'wtf??', artwork_id: artwork4.id, user_id: u4.id)