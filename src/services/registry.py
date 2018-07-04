class Registry(object):
    def __init__(self):
        self.service_registry = {}

    def add_service(self, name, service_instance):
        self.service_registry[name] = service_instance

    def get_service(self, name):
        return self.service_registry[name]
