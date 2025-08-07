function [x, i, errors]=newton(f, df, x0, toll, nmax, errors, a, b)

x(1)=x0;
fig=figure;

fplot(f, 'b-', 'LineWidth', 1.5); 
hold on;
grid on;
xlabel('x');
ylabel('f(x)');
title('Newton''s Method Iterations');
xlim([a, b]); % Limiti per l'asse x tra a e b
y_values = f(linspace(a, b, 100)); % Calcola f(x) in 100 punti equidistanti
ylim([min(y_values) - abs(0.1 * min(y_values)), max(y_values) + abs(0.1 * max(y_values))]); % Limiti y con margine

% Disegno del primo punto
plot(x(1), 0, 'r+', 'MarkerSize', 10, 'LineWidth', 2); % Punto iniziale
xlim([x0 - 1, x0 + 1]); % Limiti iniziali per il grafico
ylim([-10, 10]); 

%primo ciclo
x(2)=x(1)-(f(x(1))/df(x(1)));
i=1;
error=abs(x(i+1)-x(i));
errors(i)=error;

%grafico primo passo
plot([x(1), x(1)], [0, f(x(1))], 'k:', 'LineWidth', 1.5); % Linea verticale
plot([x(1), x(2)], [f(x(1)), 0], 'k-', 'LineWidth', 1.5); % Tangente

%ciclo while
while error>toll && i<nmax
    %calcoli-------------------------
    i=i+1;
    x(i+1)=x(i)-(f(x(i))/df(x(i)));
    error=abs(x(i+1)-x(i));
    errors(i)=error;
    % Disegno dei nuovi passi
    plot(x(i), 0, 'r+', 'MarkerSize', 10, 'LineWidth', 2); % Punto attuale
    plot([x(i), x(i)], [0, f(x(i))], 'k:', 'LineWidth', 1.5); % Linea verticale
    plot([x(i), x(i + 1)], [f(x(i)), 0], 'k-', 'LineWidth', 1.5); % Linea tangente
    % Aggiorna dinamicamente il grafico
    pause(0.5);
end

% Disegno della soluzione finale
plot(x(i + 1), 0, 'bo', 'MarkerSize', 8, 'LineWidth', 2); % Punto finale
hold off;

end

