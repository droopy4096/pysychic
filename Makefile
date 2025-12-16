.PHONY: run firewall-open firewall-close requirements

PYPSYCHIC_PORT ?= 5000
PYPSYCHIC_HOST ?= 0.0.0.0

requirements:
	pip install -r requirements.txt

run:
	flask --app responder run --host=${PYPSYCHIC_HOST} -p ${PYPSYCHIC_PORT}

firewall-open:
	sudo firewall-cmd --zone=home --add-port=5000/tcp

firewall-close:
	sudo firewall-cmd --zone=home --remove-port=5000/tcp
