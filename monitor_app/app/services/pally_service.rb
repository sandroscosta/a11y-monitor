class PallyService
  SERVICE_URL = ENV["PALLY_SERVICE_URL"] || "http://localhost:3001"

  def initialize
    @connection = Faraday.new(url: SERVICE_URL, headers: { "Content-Type" => "application/json" })
  end

  def tasks
    response = connection.get("/tasks")
    JSON.parse(response.body)
  end

  def results(task_id)
    response = connection.get("/tasks/#{task_id}/results")
    JSON.parse(response.body)
  end

  def results_by_task_id(task_id, result_id, full: false)
    response = connection.get("/tasks/#{task_id}/results/#{result_id}?full=#{full}")
    JSON.parse(response.body)
  end

  def task(id)
    response = connection.get("/tasks/#{id}")
    JSON.parse(response.body)
  end

  def create_task(task)
    response = connection.post("/tasks", task)
    if response.status == 201
      JSON.parse(response.body)
    else
      Rails.logger.error("#{response.status} Error creating task: #{response.body}")
      task = nil
    end
  end

  def run_task(id)
    response = connection.post("/tasks/#{id}/run")
    # Return true if the task was accepted for running
    response.status == 202
  end

  def update_task(id, task)
    response = connection.put("/tasks/#{id}", task.to_json)
    JSON.parse(response.body)
  end

  def delete_task(id)
    response = connection.delete("/tasks/#{id}")
    JSON.parse(response.body)
  end

  private

  def connection
    @connection
  end
end
