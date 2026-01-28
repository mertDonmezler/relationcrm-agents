# iOS 18 Contacts Skill

## Activation
Activated when working with iOS contact access, especially for iOS 18+.

## Critical Knowledge

### iOS 18 Contact Access Changes
Apple fundamentally changed contact access in iOS 18. Apps no longer get full address book access by default.

### Key Points
1. **Limited Access is Default**: Users select specific contacts to share
2. **ContactAccessButton Required**: Use Apple's new API for incremental access
3. **No More Full Dump**: Can't export entire contact list
4. **User Control**: Users can add/remove shared contacts anytime

### Implementation Pattern
```dart
// CORRECT: iOS 18+ Pattern
class ContactService {
  Future<ContactAccessResult> requestAccess() async {
    final status = await Permission.contacts.request();
    
    // iOS 18: "granted" may still be limited
    if (status == PermissionStatus.granted || 
        status == PermissionStatus.limited) {
      return ContactAccessResult.limited; // Assume limited
    }
    return ContactAccessResult.denied;
  }
  
  // Use ContactAccessButton for adding contacts
  Widget buildAddContactButton() {
    return ContactAccessButton(
      onContactSelected: (contact) {
        // User explicitly shared this contact
        saveContact(contact);
      },
    );
  }
}

// WRONG: Old Pattern (won't work on iOS 18)
// final allContacts = await ContactsService.getContacts(); // Limited results!
```

### App Store Implications
- Privacy manifest must declare contact usage
- Must explain LIMITED access in description
- Design for limited access from day one

## Resources
- Apple WWDC 2024: Contact Access Changes
- PrivacyInfo.xcprivacy requirements
