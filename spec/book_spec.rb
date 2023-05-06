require './book'

describe Book do
  context 'Test Book class' do
    it 'should create a book' do
      options = { 'id' => Random.rand(1..1000), 'genre' => 'action game', 'author' => 'author1', 'source' => 'France',
                  'label' => 'label1', 'publish_date' => '2000/02/22', 'archive' => false }
      book1 = Book.new('France', 'bad', **options)
      expect(book1.can_be_archived?).to eq(true)
      expect(book1.move_to_archive).to eq(true)
    end
  end
end
