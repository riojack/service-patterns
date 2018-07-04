from unittest import TestCase

from src.services.registry import Registry


class RegistryTest(TestCase):
    def test__returns_service_added_by_name(self):
        svc = FooBarTestService()
        svc_name = "my_service"
        reg = Registry()

        reg.add_service(svc_name, svc)

        self.assertEqual(svc, reg.get_service(svc_name))


class FooBarTestService(object):
    def __init__(self):
        self.cool_thing = "A cool thing"

    def get_cool_thing(self):
        return self.cool_thing
