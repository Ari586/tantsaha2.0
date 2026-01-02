import os

def update_file():
    source_path = 'lib/main.dart'
    target_path = 'Tantsaha/lib/main.dart'

    if not os.path.exists(target_path):
        print(f"Target file {target_path} does not exist.")
        return

    with open(source_path, 'r') as f:
        source_lines = f.readlines()

    with open(target_path, 'r') as f:
        target_lines = f.readlines()

    # Extract new class from source
    new_class_start = -1
    new_class_end = -1
    
    for i, line in enumerate(source_lines):
        if 'class OlitraUsesScreen extends StatefulWidget' in line:
            new_class_start = i
            # Look for the end of the class. It ends before "ZEZIKATECH SCREENS"
            for j in range(i, len(source_lines)):
                if '// ==================== ZEZIKATECH SCREENS ====================' in source_lines[j]:
                    new_class_end = j
                    break
            break
    
    if new_class_start == -1 or new_class_end == -1:
        print("Could not find new OlitraUsesScreen class in source.")
        return

    new_class_content = source_lines[new_class_start:new_class_end]
    print(f"Found new class: {len(new_class_content)} lines.")

    # Extract old class from target
    old_class_start = -1
    old_class_end = -1

    for i, line in enumerate(target_lines):
        if 'class OlitraUsesScreen extends StatelessWidget' in line:
            old_class_start = i
            # Look for the end of the class. It ends before "ZEZIKATECH SCREENS"
            for j in range(i, len(target_lines)):
                if '// ==================== ZEZIKATECH SCREENS ====================' in target_lines[j]:
                    old_class_end = j
                    break
            break
    
    if old_class_start == -1 or old_class_end == -1:
        print("Could not find old OlitraUsesScreen class in target.")
        return

    print(f"Found old class: {len(target_lines[old_class_start:old_class_end])} lines.")

    # Replace
    new_target_lines = target_lines[:old_class_start] + new_class_content + target_lines[old_class_end:]

    with open(target_path, 'w') as f:
        f.writelines(new_target_lines)
    
    print(f"Successfully updated {target_path}")

if __name__ == '__main__':
    update_file()
