.PHONY: bootstrap analyze test format lint ci

bootstrap:
\tflutter pub get

analyze:
\tflutter analyze

test:
\tCI=true flutter test --no-pub

format:
\tdart format -l 100 .

lint: analyze

ci: bootstrap analyze test
