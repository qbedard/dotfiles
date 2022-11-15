function pyclean --description "Remove common Python cruft"
    find . -name "*.py[co]" -type f -delete
    find . -name __pycache__ -type d -delete
    rm -rf **/*.egg-info .eggs .pytest_cache .tox \
        build dist pip-wheel-metadata report.xml
end
