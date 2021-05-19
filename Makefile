
.PHONY: quality style

# Check that source code meets quality standards

quality:
	nbqa black .
	nbqa isort . --nbqa-diff
	python -m black --check --line-length 119 --target-version py38 .
	python -m isort --check-only .
	python -m flake8 --max-line-length 119

# Format source code automatically

style:
	nbqa black . --nbqa-mutate
	nbqa isort . --nbqa-mutate
	python -m black --line-length 119 --target-version py38 .
	python -m isort .