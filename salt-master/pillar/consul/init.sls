consul:
  bootstrap_expect: 3
  retry_join:
    - 10.0.0.1
    - 10.0.0.2
    - 10.0.0.3