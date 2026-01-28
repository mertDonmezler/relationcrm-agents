# Claude Integration Skill

## Activation
Activated when implementing AI features with Claude API.

## Model Selection Guide

### Use Claude 3 Haiku (~80% of requests)
- Message suggestions
- Sentiment analysis
- Topic extraction
- Simple classifications
- Cost: $0.25/1M tokens

### Use Claude 3.5 Sonnet (~15% of requests)
- Relationship analysis
- Deep insights
- Complex reasoning
- Communication pattern analysis
- Cost: $3/1M tokens

### Use Claude 3 Opus (~5% of requests)
- Relationship coaching (premium)
- Conflict resolution advice
- Complex multi-turn conversations
- Cost: $15/1M tokens

## Cost Optimization
```typescript
// Implement prompt caching for repeated context
const cachedSystemPrompt = await cache.get('relationship_system_prompt');

// Use streaming for better UX
const stream = await claude.messages.stream({
  model: 'claude-3-haiku-20240307',
  max_tokens: 300,
  messages: [{ role: 'user', content: prompt }]
});

// Batch similar requests
const batchResults = await Promise.all(
  contacts.map(c => generateSuggestion(c))
);
```

## Ethical AI Guidelines
- Frame as "memory assistant" not "relationship automation"
- Always give user control (3 options, user chooses)
- Never auto-send messages
- Transparent about AI involvement
- Respect user preferences for AI features
