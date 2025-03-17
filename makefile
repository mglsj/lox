# Variables
JAVA_SRC_DIR = com/craftinginterpreters/lox
JAVA_FILES = $(wildcard $(JAVA_SRC_DIR)/*.java)
JAVA_MAIN_CLASS = com.craftinginterpreters.lox.Lox
JAVAC = javac
JAVA = java

# Default target
all: compile

# Compile all Java files
compile:
	@echo "Compiling Lox interpreter..."
	@$(JAVAC) $(JAVA_FILES)
	@echo "Compilation complete."

# Run the Lox interpreter in REPL mode
run: compile
	@echo "Running Lox interpreter..."
	@$(JAVA) $(JAVA_MAIN_CLASS)

# Run the Lox interpreter with a script
run-file: compile
	@if [ -z "$(FILE)" ]; then \
		echo "Usage: make run-file FILE=path/to/script.lox"; \
	else \
		echo "Running Lox script: $(FILE)"; \
		$(JAVA) $(JAVA_MAIN_CLASS) $(FILE); \
	fi

# Clean compiled class files
clean:
	@echo "Cleaning up compiled files..."
	@find . -name "*.class" -type f -delete
	@echo "Cleanup complete."

# Show help
help:
	@echo "Lox Interpreter Makefile"
	@echo ""
	@echo "Available targets:"
	@echo "  all       - Compile the Lox interpreter (default)"
	@echo "  compile   - Compile the Lox interpreter"
	@echo "  run       - Run the Lox interpreter in REPL mode"
	@echo "  run-file  - Run a Lox script (Usage: make run-file FILE=path/to/script.lox)"
	@echo "  clean     - Remove compiled class files"
	@echo "  help      - Show this help message"

.PHONY: all compile run run-file clean help
