include .env
export

PHONY: run clean clean_log duck_dev duck_prod

DBT_TARGET = dev

run:
	@echo "SPODBTIFY_SOURCE_PARQUET = $$SPODBTIFY_SOURCE_PARQUET"
	dbt run --target $(DBT_TARGET)

doc: 
	dbt docs generate && dbt docs serve 

duck_dev:
	duckdb dev.duckdb -cmd "show all tables"

duck_prod:
	duckdb prod.duckdb -cmd "show all tables"

clean: 
	unset SPODBTIFY_SOURCE_PARQUET && dbt clean && rm -rf *.duckdb

clean_log:
	rm -rf logs/*.log