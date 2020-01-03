# Make sure all dependencies are downloaded
(cd ./current; cargo check --quiet);
(cd ./feature-flagged; cargo check --quiet);

# Clean all build artifacts
(cd ./current; cargo clean);
(cd ./feature-flagged; cargo clean);

# Start the "benchmark"
echo "Compiling with all protocols enabled in debug build:"
(cd ./current; time -p cargo build --quiet);

echo "Compiling with some protocols disabled in debug build:"
(cd ./feature-flagged; time -p cargo build --quiet);

echo "Compiling with all protocols enabled in release build:"
(cd ./current; time -p cargo build --release --quiet);

echo "Compiling with some protocols disabled in release build:"
(cd ./feature-flagged; time -p cargo build --release --quiet);
