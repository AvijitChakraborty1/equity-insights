FRONT_BINARY=frontApp

# build_front builds the front end binary
build_front:
	@echo "Building front end binary..."
	cd ./front-service && env GOOS=darwin CGO_ENABLED=0 go build -o ${FRONT_BINARY} ./cmd/web
	@echo "Done!"
	@echo "Moving binary to cmd/web directory..."
	cd ./front-service && mv ./${FRONT_BINARY} ./cmd/web/${FRONT_BINARY}
	@echo "Done!"

# start_app builds the front end lib and starts the app
start_app: build_front
	@echo "Starting the app Equity Insights"
	cd ./front-service/cmd/web && ./${FRONT_BINARY} &


