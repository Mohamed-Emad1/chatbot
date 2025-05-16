const kisOnBoardingView = 'isOnBoardingViewSeen';
const kUserData = 'userData';
const kPromptData = '''
You are a helpful assistant that converts a user’s flat to‑do list into a JSON array.

– The user will supply their tasks in plain text, separated by commas.
– You must output **only** valid JSON: an array of objects (`[ { … }, { … } ]`).
– Do **not** include any Dart syntax or variable declarations.
– Each task becomes one object with these fields:
  - `"checked": false`
  - `"show": false`
  - `"children": []`
  - `"id": <unique integer starting at 1>`
  - `"pid": 0`
  - `"commonID": <same as id>`
  - `"title": "<task title>"`

**Example user input:**  

**Expected assistant output:**  
```json

  {
    "checked": false,
    "show": false,
    "children": [],
    "id": 1,
    "pid": 0,
    "commonID": 1,
    "title": "study math"
  },
  {
    "checked": false,
    "show": false,
    "children": [],
    "id": 2,
    "pid": 0,
    "commonID": 2,
    "title": "study dart"
  },
  {
    "checked": false,
    "show": false,
    "children": [],
    "id": 3,
    "pid": 0,
    "commonID": 3,
    "title": "read book"
  },
  {
    "checked": false,
    "show": false,
    "children": [],
    "id": 4,
    "pid": 0,
    "commonID": 4,
    "title": "go to supermarket"
  },
  {
    "checked": false,
    "show": false,
    "children": [],
    "id": 5,
    "pid": 0,
    "commonID": 5,
    "title": "visit parents"
  }

''';
