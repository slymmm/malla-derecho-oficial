document.addEventListener("DOMContentLoaded", () => {
  const ramos = document.querySelectorAll(".ramo");

  function actualizarEstado() {
    ramos.forEach(ramo => {
      const prereqId = ramo.dataset.prereq;

      // Si tiene prerequisito, comprobar si ya fue aprobado
      if (prereqId) {
        const prereq = document.querySelector(`.ramo[data-id="${prereqId}"]`);
        const aprobado = prereq && prereq.classList.contains("aprobado");

        if (!aprobado) {
          ramo.classList.add("bloqueado");
          ramo.classList.remove("aprobado");
        } else {
          ramo.classList.remove("bloqueado");
        }
      }
    });
  }

  ramos.forEach(ramo => {
    ramo.addEventListener("click", () => {
      // Si está bloqueado, no hacer nada
      if (ramo.classList.contains("bloqueado")) return;

      // Marcar o desmarcar como aprobado
      ramo.classList.toggle("aprobado");

      // Actualizar estados de los demás ramos
      actualizarEstado();
    });
  });

  // Al cargar la página, aplicar los bloqueos según prerequisitos
  actualizarEstado();
});

