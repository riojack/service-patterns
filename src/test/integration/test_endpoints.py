import requests

OK = requests.codes.ok

class TestEndpoints(object):
    def test__health_endpoint_exists(self):
        assert requests.get('http://127.0.0.1:3057/health').status_code == OK
