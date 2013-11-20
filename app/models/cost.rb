class Cost < ActiveRecord::Base
  belongs_to :journal

  UNIT_TYPE = ['ninku', 'dai']
end
