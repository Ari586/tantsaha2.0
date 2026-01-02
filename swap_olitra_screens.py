#!/usr/bin/env python3
"""
Script to swap OlitraProductionScreen and OlitraUsesScreen
"""

def swap_screens():
    file_path = 'lib/main.dart'
    
    with open(file_path, 'r') as f:
        lines = f.readlines()
    
    # Find OlitraProductionScreen
    production_start = -1
    production_end = -1
    for i, line in enumerate(lines):
        if 'class OlitraProductionScreen extends StatelessWidget' in line:
            production_start = i
            # Find the end (next class or section marker)
            for j in range(i + 1, len(lines)):
                if '// ========== Olitra Uses Screen ==========' in lines[j]:
                    production_end = j
                    break
            break
    
    # Find OlitraUsesScreen
    uses_start = -1
    uses_end = -1
    for i, line in enumerate(lines):
        if 'class OlitraUsesScreen extends StatefulWidget' in line:
            uses_start = i
            # Find the end (next section)
            for j in range(i + 1, len(lines)):
                if '// ==================== ZEZIKATECH SCREENS ====================' in lines[j]:
                    uses_end = j
                    break
            break
    
    if production_start == -1 or uses_start == -1:
        print("ERROR: Could not find both classes")
        return
    
    print(f"OlitraProductionScreen: lines {production_start}-{production_end}")
    print(f"OlitraUsesScreen: lines {uses_start}-{uses_end}")
    
    # Extract the classes
    production_class = lines[production_start:production_end]
    uses_class = lines[uses_start:uses_end]
    
    # Now we need to:
    # 1. Replace Production class name with Uses
    # 2. Replace Uses class name with Production
    
    # Modify production_class to become OlitraUsesScreen
    new_uses = []
    for line in production_class:
        if 'class OlitraProductionScreen' in line:
            new_uses.append(line.replace('OlitraProductionScreen', 'OlitraUsesScreen'))
        else:
            new_uses.append(line)
    
    # Modify uses_class to become OlitraProductionScreen
    new_production = []
    in_state_class = False
    for line in uses_class:
        if 'class OlitraUsesScreen extends StatefulWidget' in line:
            new_production.append(line.replace('OlitraUsesScreen', 'OlitraProductionScreen'))
        elif 'class _OlitraUsesScreenState extends State<OlitraUsesScreen>' in line:
            new_production.append(line.replace('_OlitraUsesScreenState', '_OlitraProductionScreenState').replace('OlitraUsesScreen', 'OlitraProductionScreen'))
            in_state_class = True
        elif 'State<OlitraUsesScreen> createState() => _OlitraUsesScreenState();' in line:
            new_production.append(line.replace('OlitraUsesScreen', 'OlitraProductionScreen').replace('_OlitraUsesScreenState', '_OlitraProductionScreenState'))
        else:
            new_production.append(line)
    
    # Build new file
    new_lines = (
        lines[:production_start] +
        ['// ========== Olitra Production Screen ==========\n'] +
        new_production +
        ['\n', '// ========== Olitra Uses Screen ==========\n'] +
        new_uses +
        lines[uses_end:]
    )
    
    # Write back
    with open(file_path, 'w') as f:
        f.writelines(new_lines)
    
    print("✅ Successfully swapped OlitraProductionScreen and OlitraUsesScreen")
    print(f"   Production is now StatefulWidget with React data")
    print(f"   Uses is now StatelessWidget with simple data")

if __name__ == '__main__':
    swap_screens()
