import requests
from pytest_bdd import scenario, given, when, then
import pytest

OK = requests.codes.ok

@scenario('../../features/app.feature', 'Application')
def bdd_test__bootstrap():
    pass

@given('the website is running')
def bdd_test__the_website_is_running():
    assert requests.get('http://127.0.0.1:3057/health').status_code == OK

@when('a REST request is made on /health')
@then('the response has status code of "200"')
@then('the response text contains exactly "OK"')
def bdd_test__a_rest_request_is_made_on_slash_health():
    assert requests.get('http://127.0.0.1:3057/health').text == 'OK'
