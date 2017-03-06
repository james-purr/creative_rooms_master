require 'rails_helper'

RSpec.describe RoomImage, type: :model do
	it { should have_attached_file(:image) }
	it { should validate_attachment_presence(:image) }
	it { should validate_attachment_content_type(:image).
	            allowing('image/png', 'image/jpeg').
	            rejecting('text/plain', 'text/xml') }
	it { should validate_attachment_size(:image).
        less_than(10.megabytes) }

	it 'should belong to a room' do
  		ri = RoomImage.reflect_on_association(:room)
  		ri.macro.should == :belongs_to
	end
end
