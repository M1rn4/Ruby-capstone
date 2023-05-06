require './music_album'

describe MusicAlbum do
  context 'Test MusicAlbum class' do
    it 'should create a a music album' do
      options1 = { 'genre' => 'action game', 'author' => 'author1', 'source' => 'France',
                   'label' => 'label1', 'publish_date' => '2000/02/22', 'archive' => false }
      options2 = { 'genre' => 'action game', 'author' => 'author1', 'source' => 'France',
                   'label' => 'label1', 'publish_date' => '2020/02/22', 'archive' => false }
      album1 = MusicAlbum.new(true, Random.rand(1..1000), **options1)
      album2 = MusicAlbum.new(false, Random.rand(1..1000), **options2)
      expect(album1.can_be_archived?).to eq(true)
      expect(album1.move_to_archive).to eq(true)
      expect(album2.can_be_archived?).to eq(false)
    end
  end
end
