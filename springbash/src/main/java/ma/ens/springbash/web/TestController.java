package ma.ens.springbash.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.time.LocalDateTime;
import java.util.Map;

@RestController
public class TestController {

    @GetMapping("/")
    public Map<String, String> home() {
        return Map.of(
                "message", "Bienvenue sur l'application Spring Bash !",
                "status", "En ligne",
                "time", LocalDateTime.now().toString()
        );
    }

    @GetMapping("/health")
    public Map<String, String> health() {
        return Map.of(
                "status", "UP",
                "message", "L'application fonctionne correctement"
        );
    }
}