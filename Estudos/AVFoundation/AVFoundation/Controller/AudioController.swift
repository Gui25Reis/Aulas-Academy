/* Gui Reis     -    gui.sreis25@gmail.com     -    Created on 16/07/21 */

/* Bibliotecas necessárias: */
import AVFoundation


class AudioController: AudioDelegate {
    
    /* MARK: - Atributos */
    
    /// Singleton
    static let shared = AudioController()
    
    
    /// Variável para memoization
    private lazy var loadedAudios: [String : AVAudioPlayer] = [:]
    
    
    
    /* MARK: - Delegate */
    
    /// Muda a variável que verifica se os sons estão ativados ou não
    internal func toggleSound() -> Void {
        switch self.updateUserDefaults(soundType: .sound) {
        case true:
            self.soundManager(with: .button, soundAction: .play)
        case false:
            self.soundManager(with: .button, soundAction: .pause)
        }
    }
    
    
    /// Muda a variável que verifica se as músicas estão ativadas ou não
    internal func toggleMusic() -> Void {
        switch self.updateUserDefaults(soundType: .music) {
            case true:
                self.soundManager(with: .backgroundMusic, soundAction: .play)
            case false:
                self.soundManager(with: .backgroundMusic, soundAction: .pause)
        }
    }
    
    
    
    /* MARK: - Métodos */
    
    /// Verifica o conteúdo da variável salva no User Defaults
    public func getUserDefaultsStatus(with key: AudioType) -> Bool {
        return UserDefaults.standard.bool(forKey: key.description)
    }
    
    
    /// Mexe com um áudio específico
    public func soundManager(with sound: AudiosList, soundAction: AudiosAction, _ reproduction: AudioReproduction = .oneTime) -> Void {
        
        let userDefaultsKey = self.verifyAudioType(with: sound).description
        
        // Verifica se o som está ativado
        let audio = self.getMusic(from: sound, reproduction: reproduction)
        
        if let audio = audio {
            switch soundAction {
            case .play:
                if UserDefaults.standard.bool(forKey: userDefaultsKey) {
                    audio.play()
                }
            case .pause:
                audio.stop()
            }
        }
    }
    
    
    /// Atualiza a variável no UserDefaults
    private func updateUserDefaults(soundType: AudioType) -> Bool {
        var sound = UserDefaults.standard.bool(forKey: soundType.description)
        sound.toggle()
        UserDefaults.standard.setValue(sound, forKey: soundType.description)
        
        return self.getUserDefaultsStatus(with: soundType)
    }
    
    
    /// Pega o arquivo de áudio e tranforma na variável AVAudioPlayer para poder manusear
    private func getMusic(from music: AudiosList, reproduction: AudioReproduction) -> AVAudioPlayer? {
        
        // Verifica se o áudio já foi criado
        if let audio = self.loadedAudios[music.description] {
            return audio
        }
        
        // Cria o áudio
        if let audioFile = Bundle.main.url(forResource: music.description, withExtension: nil) {
            do {
                let audio = try AVAudioPlayer(contentsOf: audioFile)
                audio.numberOfLoops = reproduction.rawValue

                // Salva o áudio já criado (memoization)
                self.loadedAudios[music.description] = audio
                return audio
            } catch {
                print(">>> ERRO: N foi possível reproduzir o áudio")
                return nil
            }
        }
        return nil
    }
    
    
    private func verifyAudioType(with sound: AudiosList) -> AudioType {
        if sound == .backgroundMusic {
            return .music
        }
        return .sound
    }
}


