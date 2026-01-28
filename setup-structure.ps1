# RelationCRM-Agents Setup Script
$baseDir = "C:\Users\dell\Desktop\RelationCRM-Agents"

$plugins = @(
    "flutter-mobile-dev",
    "backend-api-dev", 
    "ai-relationship-engine",
    "integrations-hub",
    "quality-assurance",
    "infrastructure-ops",
    "growth-monetization",
    "privacy-compliance",
    "orchestration-workflows"
)

foreach ($plugin in $plugins) {
    $pluginPath = "$baseDir\plugins\$plugin"
    New-Item -ItemType Directory -Force -Path "$pluginPath\agents"
    New-Item -ItemType Directory -Force -Path "$pluginPath\commands"
    New-Item -ItemType Directory -Force -Path "$pluginPath\skills"
}

New-Item -ItemType Directory -Force -Path "$baseDir\docs"
New-Item -ItemType Directory -Force -Path "$baseDir\scripts"

Write-Host "Structure created!" -ForegroundColor Green
