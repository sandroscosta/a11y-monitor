require "test_helper"
require "minitest/mock"

class ProcessServiceTaskJobTest < ActiveJob::TestCase
  def setup
    @task = { name: "Google", url: "https://www.google.com", standard: "WCAG2AA" }
    @service_task_mock = Minitest::Mock.new
    @service_task_mock.expect(:run_task, true, [String])
    @service_task = ServiceTask.create(@task)
  end

  test "has no enqueued jobs" do
    assert_enqueued_jobs 0
  end

  test "has one enqueued job" do
    # fetch object from fixture
    PallyService.stub(:instance, @service_task_mock) do
      ProcessServiceTaskJob.perform_later(@service_task)
      assert_enqueued_jobs 1
    end
  end

  test "has performed the enqueued job" do
    assert_performed_jobs 0

    PallyService.stub(:instance, @service_task_mock) do
      perform_enqueued_jobs do
        ProcessServiceTaskJob.perform_later(@service_task)
      end
    end

    assert_performed_jobs 1
  end
end
