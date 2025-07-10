import gspread
from google.oauth2.service_account import Credentials
from robot.api.deco import keyword

_creds = None
_client = None

def connect_to_gsheet(creds_file='credentials.json'):
    global _creds, _client
    if _client is None:
        scope = [
            "https://www.googleapis.com/auth/spreadsheets.readonly",
            "https://www.googleapis.com/auth/drive.readonly"
        ]
        _creds = Credentials.from_service_account_file(creds_file, scopes=scope)
        _client = gspread.authorize(_creds)

@keyword("Fetch Login Credentials From Sheet")
def fetch_login_credentials_from_sheet(sheet_id, sheet_name, row):
    connect_to_gsheet("D:/auto_test_EME/Demo/Resources/credentials.json")
    sheet = _client.open_by_key(sheet_id).worksheet(sheet_name)
    headers = sheet.row_values(1)
    values = sheet.row_values(int(row))
    data = {headers[i]: values[i] if i < len(values) else "" for i in range(len(headers))}
    return data
