with (drawregion.deity) if (selected) {  instance_destroy()}
with (lemongrab.semis[drawregion.region]) if (selected) {instance_destroy() }
with (lemongrab.backs[drawregion.region]) if (selected) {instance_destroy()  }
with (lemongrab.waters[drawregion.region]) if (selected) {instance_destroy()   }
with (drawregion) {selected_array[0]=0 UPDATE_THE_DEITIES=1 event_user(7)}
