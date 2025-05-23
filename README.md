# Auto-Commit Tool

A command-line tool that automatically generates meaningful commit messages using Google's Gemini AI and handles git commits and pushes. It also includes automatic code review capabilities.

## Features

- Beautiful terminal interface with colors and formatting
- Dual language support (English/Tiếng Việt) for:
  * Terminal interface
  * Commit messages
- AI-powered code review
- Automatic commit message generation
- Configurable default behaviors
- Proper emoji formatting for commit types
- Runs in isolated virtual environment

## Interface Languages

The tool supports two separate language settings:

1. **Terminal Interface Language**
   - English: All prompts and messages in English
   - Tiếng Việt: All prompts and messages in Vietnamese
   - Selected during installation
   - Can be changed with `auto-commit --reconfigure`

2. **Commit Message Language**
   - English: Professional commit messages
   - Tiếng Việt: Commit messages in Vietnamese
   - Independent from interface language
   - Can be different from interface language

## Prerequisites

- Python 3.x
- Git
- A Gemini API key (get it from [Google AI Studio](https://makersuite.google.com/app/apikey))

## Installation

1. Clone or download this repository
2. Navigate to the tool directory
3. Run the installation script:

```bash
chmod +x install.sh
./install.sh
```

During installation, you'll be prompted to configure:
1. Interface language (English/Tiếng Việt)
2. Commit message language
3. Gemini API key
4. AI model choice
5. Default behaviors:
   - Auto-push after commit
   - Auto-review before commit

## Configuration

You can manage all settings through the configuration menu:

```bash
# Open configuration menu
dtl --reconfigure
```

Available settings:
1. Interface language
2. Commit message language
3. Gemini API key
4. AI model
5. Auto-push (enabled/disabled)
6. Auto-review (enabled/disabled)

Default behaviors:
- Auto-push: Disabled by default
- Auto-review: Enabled by default

## Usage

Basic usage:
```bash
# Full process with default settings
dtl auto-commit

# Override auto-push setting
dtl --no-push

# Override auto-review setting
dtl --no-review

# Configure all settings
dtl --reconfigure
```

## Code Review Features

The tool performs automatic code review with beautiful formatting:
- 🐛 Potential bugs and issues
- 💡 Code improvement suggestions
- 🔍 Code smells and anti-patterns
- 🔒 Security concerns

## Commit Message Format

Messages are formatted with emojis based on type. Examples:

```
✨ feat: Add user authentication
- Implement JWT token validation
- Add login endpoints
```

```
🐛 fix: Resolve memory leak in worker pool
- Fix resource cleanup in worker threads
- Add proper error handling
```

Available types:
- ✨ feat: New features
- 🐛 fix: Bug fixes
- 📚 docs: Documentation
- 💎 style: Code style
- ♻️ refactor: Code refactoring
- ⚡️ perf: Performance
- 🧪 test: Testing
- 🔧 chore: Maintenance
- 👷 ci: CI/CD
- 📦 build: Build
- ⏪ revert: Reverts

## Configuration Storage

Settings are stored in `~/.config/auto-commit/config.json`:
- Gemini API key
- Model preference
- Interface language
- Commit message language
- Auto-push preference
- Auto-review preference

## Uninstallation

To remove the tool:
```bash
./uninstall.sh
```

## Security Note

Your API key is stored locally in the configuration file. Keep it secure and never share it.

## Troubleshooting

If you encounter issues:
1. Check terminal PATH after installation
2. Verify Gemini API key
3. Ensure git repository is initialized
4. Check virtual environment activation

To reset all settings:
```bash
rm -rf ~/.config/auto-commit
auto-commit --reconfigure
```

## License

MIT License - Feel free to modify and distribute this tool as needed.