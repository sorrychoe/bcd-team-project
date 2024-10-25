.PHONY: init lint format test clear

NAME = BCD-team2

SHELL := bash
python = python3
pip_user_option = --user

ifeq ($(OS),Windows_NT)
	python := python
endif

init:
	$(python) -m pip install $(pip_user_option) --upgrade pip && \
	$(python) -m pip install $(pip_user_option) -r requirements.txt && \
	pre-commit install

lint:
	$(python) -m isort --settings-file=setup.cfg src/

format:
	$(python) -m flake8 --config=setup.cfg src/

test:
	$(python) -m pytest src/

clear:
	shopt -s globstar ; \
	rm -fr **/__pycache__ **/.pytest_cache;
