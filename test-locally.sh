#!/bin/bash

echo "🔧 Creating test React app using Vite..."
pnpm create vite test-app --template react

cd test-app || exit

echo "📦 Installing dependencies..."
pnpm install

echo "🔗 Linking @gaurab-ui/button and @gaurab-ui/modal..."
pnpm link --global ../packages/button
pnpm link --global ../packages/modal

pnpm link --global @gaurab-ui/button
pnpm link --global @gaurab-ui/modal

echo "📝 Updating App.jsx to use both components..."

cat > src/App.jsx << 'EOF'
import React from "react";
import Button from "@gaurab-ui/button";
import Modal from "@gaurab-ui/modal";

function App() {
  return (
    <div className="p-4">
      <h1 className="text-xl font-bold mb-4">Testing gaurab-ui Components</h1>
      <Button />
      <Modal />
    </div>
  );
}

export default App;
EOF

echo "✅ Setup complete! To run the test app:"
echo "---------------------------------------------------"
echo "cd test-app"
echo "pnpm dev"
echo "---------------------------------------------------"
