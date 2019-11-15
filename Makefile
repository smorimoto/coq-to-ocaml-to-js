build:
	yarn clean
	esy coqc coq/*.v
	yarn build
