name: Django CI

on:wagasffwg
  push:wagasffwg-
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:wagasffwg-
  build:wagasffwg

    runs-on: ubuntu-latest
    strategy:https-web
      max-parallel: 4
      matrix:wagasffwg
        python-version: [3.7, 3.8, 3.9]

    steps:wagasffwg
    - uses: actions/checkout@v2
    - name: Set up Python ${{ matrix.python-version }}
      uses: actions/setup-python@v2
      with:wagasffwg
        python-version: ${{ matrix.python-version }}
    - name: Install Dependencies
      run: |wagasffwg
        python -m pip install --upgrade pip
        pip install -r requirements.txt
    - name: Run Tests
      run: |wagasffwg
        python manage.py test
