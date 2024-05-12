every :day, at: '11:00pm' do
  runner "ProcessOccurCountsJob.perform_now"
end
