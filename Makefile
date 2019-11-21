build:
	yarn clean
	esy coqc theories/*.v
	yarn build
