.PHONY: run firewall-open firewall-close

run:
	flask --app responder run --host=0.0.0.0

firewall-open:
	sudo firewall-cmd --zone=home --add-port=5000/tcp

firewall-close:
	sudo firewall-cmd --zone=home --remove-port=5000/tcp
