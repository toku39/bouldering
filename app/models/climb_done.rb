class ClimbDone < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '完登' },
    { id: 3, name: '未完登' }
  ]

  include ActiveHash::Associations
  has_many :problems
end
