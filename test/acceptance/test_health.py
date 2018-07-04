import requests
from pytest_bdd import scenario, given, when, then
import pytest

OK = requests.codes.ok


@scenario('../../features/app.feature', 'Application')
def bdd_test__bootstrap(resp):
    pass


@pytest.fixture
def resp():
    return requests.get('http://127.0.0.1:3057/health')


@given('the website is running')
def bdd_test__the_website_is_running(resp):
    pass


@when('a REST request is made on /health')
def bdd_test__a_rest_request_is_made_on_slash_health(resp):
    pass


@then('the response has status code of "200"')
def bdd_test__the_response_has_status_code_of_200(resp):
    assert resp.status_code == OK


@then('the response text contains exactly "OK"')
def bdd_test__the_response_text_contains_exactly_ok(resp):
    assert resp.text == 'OK'
