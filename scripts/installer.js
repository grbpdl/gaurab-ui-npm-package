#!/usr/bin/env node
const inquirer = require("inquirer");
const fs = require("fs");
const path = require("path");

(async () => {
  const { componentName, installPath } = await inquirer.prompt([
    {
      type: "list",
      name: "componentName",
      message: "Which component do you want to install?",
      choices: fs.readdirSync("packages"),
    },
    {
      type: "input",
      name: "installPath",
      message: "Enter path to install component (default: src/components):",
      default: "src/components",
    },
  ]);

  const sourcePath = path.join("packages", componentName);
  const targetPath = path.join(process.cwd(), installPath, componentName);

  fs.mkdirSync(targetPath, { recursive: true });
  fs.cpSync(sourcePath, targetPath, { recursive: true });

  console.log(`✅ ${componentName} installed at ${targetPath}`);
})();
