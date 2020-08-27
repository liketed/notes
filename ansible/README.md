Top 10 ansible resources


tasks/main.yml

- name: Copy file with owner and permissions
  copy:
    src: foo.conf
    dest: /etc/foo.conf
    owner: foo
    group: foo
    mode: '0644'
