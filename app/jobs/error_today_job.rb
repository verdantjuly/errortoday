class ErrorTodayJob < ApplicationJob
  queue_as :default

    def perform
      start_time = Time.zone.now.beginning_of_day - 1.day
      end_time = Time.zone.now.beginning_of_day

      highest_count_occur = Occur
        .where(created_at: start_time..end_time)
        .group(:error_id)
        .count
        .max_by { |_, count| count }

      highest_count_error = highest_count_occur&.first
      highest_count_error = Error
    .find_by(id: highest_count_error)

    if highest_count_error
      puts "가장 높은 개수를 갖는 error_id: #{highest_count_error}"
      puts "해당 error_id에 대한 Error 정보:"
      puts highest_count_error.inspect
    else
      puts "어제부터 오늘까지 기간에 발생한 오류가 없습니다."
    end
    Error.where(today: true).update_all(today: false)
    highest_count_error.update(today: true)
    end
end
