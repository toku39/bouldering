class Grade < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'V0' },
    { id: 3, name: 'V1' },
    { id: 4, name: 'V2' },
    { id: 5, name: 'V3' },
    { id: 6, name: 'V4' },
    { id: 7, name: 'V5' },
    { id: 8, name: 'V6' },
    { id: 9, name: 'V7' },
    { id: 10, name: '10級' },
    { id: 11, name: '9級' },
    { id: 12, name: '8級' },
    { id: 13, name: '7級' },
    { id: 14, name: '6級' },
    { id: 15, name: '5級' },
    { id: 16, name: '4級' },
    { id: 17, name: '3級' },
    { id: 18, name: '2級' },
    { id: 19, name: '1級' },
    { id: 20, name: '初段' },
    { id: 21, name: '2段' }
  ]

  include ActiveHash::Associations
  has_many :problems
end
