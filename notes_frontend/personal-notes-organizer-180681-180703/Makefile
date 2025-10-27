# CI-friendly Makefile to run Flutter tasks from the correct directory.

APP_DIR := personal-notes-organizer-180681-180703/notes_frontend

.PHONY: pub_get analyze test all format_check

pub_get:
	@cd $(APP_DIR) && flutter pub get

analyze:
	@cd $(APP_DIR) && flutter analyze

test:
	@cd $(APP_DIR) && flutter test

format_check:
	@cd $(APP_DIR) && dart format --output=none --set-exit-if-changed .

all: pub_get analyze test
