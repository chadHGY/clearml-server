from clearml import Task
from clearml.backend_api.session.client import APIClient

client=APIClient()

print(client.session.host)
print(client.session.access_key, client.session.secret_key, '\n\n')

task = Task.init(project_name="test_project", task_name="my task")

print("hello world")